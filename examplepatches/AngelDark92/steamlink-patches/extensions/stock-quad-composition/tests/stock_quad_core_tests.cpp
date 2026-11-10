// Pure tests of the production header src/stock_quad_core.h: no layer, no runtime.
#include "test_support.h"

#include "../src/stock_quad_core.h"

#include <cstring>
#include <limits>

using namespace gxr::sq;
using namespace testsupport;

namespace {

void goldenGeometry() {
    for (const Golden& g : kGolden) {
        XrPosef pose{};
        XrExtent2Df size{};
        CHECK(composeQuad(g.head, g.eye, g.fov, &pose, &size));
        constexpr double tol = 2e-5;
        CHECK_NEAR(pose.orientation.x, g.outQ.x, tol);
        CHECK_NEAR(pose.orientation.y, g.outQ.y, tol);
        CHECK_NEAR(pose.orientation.z, g.outQ.z, tol);
        CHECK_NEAR(pose.orientation.w, g.outQ.w, tol);
        CHECK_NEAR(pose.position.x, g.outP.x, tol);
        CHECK_NEAR(pose.position.y, g.outP.y, tol);
        CHECK_NEAR(pose.position.z, g.outP.z, tol);
        CHECK_NEAR(size.width, g.outSize.width, tol);
        CHECK_NEAR(size.height, g.outSize.height, tol);
    }
    // The constant is the float 0x3fff7cee widened to double.
    CHECK(static_cast<float>(kQuadDistance) == 1.99600005f);
}

void validators() {
    XrQuaternionf q{0, 0, 0, 1};
    CHECK(validQuaternion(q));
    q = {0, 0, 0, 0};
    CHECK(!validQuaternion(q));
    q = {0, 0, 0, std::numeric_limits<float>::quiet_NaN()};
    CHECK(!validQuaternion(q));
    q = {1, 1, 1, 1};
    CHECK(!validQuaternion(q));
    CHECK(validFov(fovBase()));
    CHECK(!validFov({0.5f, -0.5f, 0.5f, -0.5f}));            // inverted
    CHECK(!validFov({-1.6f, 0.5f, 0.5f, -0.5f}));            // beyond limit
    CHECK(!validFov({-0.5f, 0.5f, std::numeric_limits<float>::infinity(), -0.5f}));
    CHECK(!validFov({-0.5f, 0.5f, 0.5f, 0.5f}));             // zero height
    XrPosef pose = identityPose();
    pose.position.y = std::numeric_limits<float>::quiet_NaN();
    CHECK(!validPose(pose));
    // Degenerate geometry is refused instead of emitting a non-finite quad.
    XrPosef out{};
    XrExtent2Df size{};
    CHECK(!composeQuad(identityPose(), identityPose(), {-0.5f, -0.5f, 0.5f, -0.5f}, &out, &size));
}

void eyeLocate() {
    XrView views[2]{{XR_TYPE_VIEW}, {XR_TYPE_VIEW}};
    views[0].pose = identityPose();
    views[1].pose = identityPose();
    views[0].pose.position.x = -0.032f;
    views[1].pose.position.x = 0.032f;
    constexpr XrViewStateFlags ok =
        XR_VIEW_STATE_ORIENTATION_VALID_BIT | XR_VIEW_STATE_POSITION_VALID_BIT;
    XrPosef out[2]{};
    CHECK(validateLocatedEyes(ok, 2, views, out));
    CHECK(out[0].position.x == -0.032f && out[1].position.x == 0.032f);
    CHECK(!validateLocatedEyes(XR_VIEW_STATE_ORIENTATION_VALID_BIT, 2, views, out));
    CHECK(!validateLocatedEyes(XR_VIEW_STATE_POSITION_VALID_BIT, 2, views, out));
    CHECK(!validateLocatedEyes(ok, 1, views, out));
    CHECK(!validateLocatedEyes(ok, 2, nullptr, out));
    XrView bad[2] = {views[0], views[1]};
    bad[1].pose.position.x = -0.032f;  // zero IPD
    CHECK(!validateLocatedEyes(ok, 2, bad, out));
    bad[1].pose.position.x = 0.9f;     // implausible IPD
    CHECK(!validateLocatedEyes(ok, 2, bad, out));
    bad[1] = views[1];
    bad[1].pose.orientation = {0, 0, 0, 0};
    CHECK(!validateLocatedEyes(ok, 2, bad, out));
}

void shapeAccepts() {
    for (int projections : {2, 3}) {
        Source source(projections, 0, kGolden[1].head, fovBase(), fovFovea());
        Plan plan;
        CHECK(planFrame(&source.info, 16, &plan) == Reject::None);
        CHECK(plan.layout == (projections == 3 ? Layout::ThreeProjection : Layout::TwoProjection));
        CHECK(plan.sourceProjectionCount == static_cast<uint32_t>(projections));
        CHECK(plan.tailCount == 0 && plan.outputCount == kQuadCount);
        CHECK(plan.base == &source.base() && plan.fovea == &source.fovea());
    }
    // Unrelated tail layers (fade quads) are counted and keep their position after the quads.
    Source tail(3, 2, kGolden[1].head, fovBase(), fovFovea());
    Plan plan;
    CHECK(planFrame(&tail.info, 6, &plan) == Reject::None);
    CHECK(plan.tailStart == 3 && plan.tailCount == 2 && plan.outputCount == 6);
    CHECK(planFrame(&tail.info, 5, &plan) == Reject::LayerCap);  // runtime cap would be exceeded
    CHECK(planFrame(&tail.info, 0, &plan) == Reject::LayerCap);  // unknown cap fails closed
}

void stockAndForeignShapesAreNotConverted() {
    // Stock 5002527: four quads and no projection layer => original submission, not converted.
    XrCompositionLayerQuad quads[4]{};
    const XrCompositionLayerBaseHeader* layers[4];
    for (int i = 0; i < 4; ++i) {
        quads[i].type = XR_TYPE_COMPOSITION_LAYER_QUAD;
        layers[i] = reinterpret_cast<const XrCompositionLayerBaseHeader*>(&quads[i]);
    }
    XrFrameEndInfo info{XR_TYPE_FRAME_END_INFO};
    info.environmentBlendMode = XR_ENVIRONMENT_BLEND_MODE_OPAQUE;
    info.layerCount = 4;
    info.layers = layers;
    Plan plan;
    CHECK(planFrame(&info, 16, &plan) == Reject::NotApplicable);
    CHECK(plan.layout == Layout::None);
    info.layerCount = 0;
    CHECK(planFrame(&info, 16, &plan) == Reject::NotApplicable);
    // 1 and 4 leading projections are not a verified layout.
    for (int projections : {1, 4}) {
        XrCompositionLayerProjection ps[4]{};
        const XrCompositionLayerBaseHeader* ls[4];
        for (int i = 0; i < projections; ++i) {
            ps[i].type = XR_TYPE_COMPOSITION_LAYER_PROJECTION;
            ls[i] = reinterpret_cast<const XrCompositionLayerBaseHeader*>(&ps[i]);
        }
        XrFrameEndInfo frame{XR_TYPE_FRAME_END_INFO};
        frame.environmentBlendMode = XR_ENVIRONMENT_BLEND_MODE_OPAQUE;
        frame.layerCount = projections;
        frame.layers = ls;
        CHECK(planFrame(&frame, 16, &plan) == Reject::UnsupportedProjectionCount);
    }
}

template <typename Mutate>
void expectReject(int projections, Reject expected, Mutate mutate) {
    Source source(projections, 1, kGolden[1].head, fovBase(), fovFovea());
    mutate(source);
    Plan plan;
    const Reject actual = planFrame(&source.info, 16, &plan);
    if (actual != expected) {
        std::cerr << "expected " << rejectName(expected) << " got " << rejectName(actual)
                  << " (projections " << projections << ")\n";
        std::abort();
    }
    CHECK(plan.layout == Layout::None && plan.base == nullptr);
}

void shapeRejects() {
    for (int n : {2, 3}) {
        expectReject(n, Reject::BadFrameInfo, [](Source& s) { s.info.type = XR_TYPE_VIEW; });
        expectReject(n, Reject::BadFrameInfo, [](Source& s) { s.info.layers = nullptr; });
        expectReject(n, Reject::NonOpaque, [](Source& s) {
            s.info.environmentBlendMode = XR_ENVIRONMENT_BLEND_MODE_ADDITIVE; });
        expectReject(n, Reject::NullLayer, [](Source& s) { s.layers.back() = nullptr; s.refresh(); });
        expectReject(n, Reject::ProjectionInTail, [](Source& s) {
            s.layers.push_back(s.layers[0]); s.refresh(); });
        // Source projection next may only be one XrCompositionLayerSettingsFB with no successor.
        expectReject(n, Reject::BadLayerNext, [](Source& s) {
            s.base().next = &s.tail[0]; });
        expectReject(n, Reject::BadLayerNext, [](Source& s) {
            s.fovea().next = &s.tail[0]; });
        expectReject(n, Reject::BadLayerNext, [](Source& s) {
            s.settings[0].next = &s.tail[0]; s.projections[0].next = &s.settings[0]; });
        expectReject(n, Reject::BadViewCount, [](Source& s) { s.base().viewCount = 1; });
        expectReject(n, Reject::BadViewCount, [](Source& s) { s.fovea().views = nullptr; });
        expectReject(n, Reject::BadViewType, [](Source& s) {
            s.baseView(1).type = XR_TYPE_COMPOSITION_LAYER_QUAD; });
        expectReject(n, Reject::BadViewNext, [](Source& s) {
            s.baseView(0).next = &s.settings[0]; });
        expectReject(n, Reject::BadViewNext, [](Source& s) {
            s.foveaView(1).next = &s.settings[0]; });
        expectReject(n, Reject::BadFlags, [](Source& s) { s.base().layerFlags = 6; });
        expectReject(n, Reject::BadFlags, [](Source& s) { s.fovea().layerFlags = 0; });
        expectReject(n, Reject::BadFlags, [](Source& s) { s.fovea().layerFlags = 7; });
        expectReject(n, Reject::BadSpace, [](Source& s) { s.base().space = XR_NULL_HANDLE; });
        expectReject(n, Reject::BadFov, [](Source& s) { s.baseView(1).fov.angleLeft = 0.9f; });
        expectReject(n, Reject::BadFov, [](Source& s) {
            s.foveaView(0).fov.angleUp = std::numeric_limits<float>::quiet_NaN(); });
        expectReject(n, Reject::BadPose, [](Source& s) {
            s.baseView(0).pose.orientation = {0, 0, 0, 0}; });
        expectReject(n, Reject::BadSubImage, [](Source& s) {
            s.foveaView(1).subImage.swapchain = XR_NULL_HANDLE; });
        expectReject(n, Reject::BadSubImage, [](Source& s) {
            s.baseView(0).subImage.imageRect.extent.width = 0; });
        expectReject(n, Reject::PoseMismatch, [](Source& s) {
            s.baseView(1).pose.position.x += 0.001f; });
        expectReject(n, Reject::PoseMismatch, [](Source& s) {
            s.foveaView(0).pose.position.y += 0.001f; });
        expectReject(n, Reject::SwapchainMismatch, [](Source& s) {
            s.foveaView(0).subImage.swapchain = s.baseView(1).subImage.swapchain; });
    }
    // The dropped underside layer still has to look like one.
    expectReject(3, Reject::BadFlags, [](Source& s) { s.projections[0].layerFlags = 6; });
    expectReject(3, Reject::BadViewCount, [](Source& s) { s.projections[0].viewCount = 0; });
    expectReject(3, Reject::BadLayerNext, [](Source& s) { s.projections[0].next = &s.tail[0]; });
}

void quadsPreserveSourceIdentities() {
    for (int n : {2, 3}) {
        Source source(n, 0, kGolden[1].head, fovBase(), fovFovea());
        source.baseView(0).subImage.imageArrayIndex = 0;
        Plan plan;
        CHECK(planFrame(&source.info, 16, &plan) == Reject::None);
        XrPosef eyes[2] = {identityPose(), identityPose()};
        eyes[0].position.x = -0.032f;
        eyes[1].position.x = 0.032f;
        XrCompositionLayerQuad quads[4]{};
        CHECK(buildQuads(plan, eyes, quads));
        const XrEyeVisibility vis[4] = {XR_EYE_VISIBILITY_LEFT, XR_EYE_VISIBILITY_RIGHT,
                                        XR_EYE_VISIBILITY_LEFT, XR_EYE_VISIBILITY_RIGHT};
        const XrCompositionLayerFlags flags[4] = {0, 0, 6, 6};
        for (int i = 0; i < 4; ++i) {
            const auto& family = i < 2 ? source.base() : source.fovea();
            CHECK(quads[i].type == XR_TYPE_COMPOSITION_LAYER_QUAD);
            CHECK(quads[i].eyeVisibility == vis[i]);
            CHECK(quads[i].layerFlags == flags[i]);
            CHECK(quads[i].next == family.next);  // original per-family settings pointer
            CHECK(quads[i].space == family.space);
            CHECK(std::memcmp(&quads[i].subImage, &family.views[i % 2].subImage,
                              sizeof(XrSwapchainSubImage)) == 0);
        }
        CHECK(quads[0].next == quads[1].next && quads[2].next == quads[3].next);
        CHECK(quads[0].next != quads[2].next);
        // Eye term: identical head pose, so the left/right centres differ by the eye offsets.
        CHECK(quads[1].pose.position.x - quads[0].pose.position.x > 0.0f);
    }
}

void processGuard() {
    const char exact[] = "com.valvesoftware.steamlinkvr";
    CHECK(isTargetProcess(exact, sizeof(exact) - 1, "com.valvesoftware.steamlinkvr"));
    CHECK(isTargetProcess(exact, sizeof(exact), "com.valvesoftware.steamlinkvr"));
    const char service[] = "com.valvesoftware.steamlinkvr:remote";
    CHECK(!isTargetProcess(service, sizeof(service) - 1, "com.valvesoftware.steamlinkvr"));
    const char prefix[] = "com.valvesoftware.steamlink";
    CHECK(!isTargetProcess(prefix, sizeof(prefix) - 1, "com.valvesoftware.steamlinkvr"));
    const char longer[] = "com.valvesoftware.steamlinkvrx";
    CHECK(!isTargetProcess(longer, sizeof(longer) - 1, "com.valvesoftware.steamlinkvr"));
    CHECK(!isTargetProcess("", 0, "com.valvesoftware.steamlinkvr"));
}

void rejectNamesAreDistinct() {
    for (uint32_t a = 0; a < static_cast<uint32_t>(Reject::Count_); ++a) {
        CHECK(std::strcmp(rejectName(static_cast<Reject>(a)), "unknown") != 0);
        for (uint32_t b = a + 1; b < static_cast<uint32_t>(Reject::Count_); ++b) {
            CHECK(std::strcmp(rejectName(static_cast<Reject>(a)),
                              rejectName(static_cast<Reject>(b))) != 0);
        }
    }
    CHECK(static_cast<uint32_t>(Reject::Count_) <= 32);  // reasons are logged via a 32-bit mask
}

void projectionStripping() {
    Source source = Source(3, 2, kGolden[1].head, kGolden[1].fov, fovFovea());
    CHECK(frameIterable(&source.info));
    CHECK(!frameIterable(nullptr));
    XrFrameEndInfo bad = source.info;
    bad.type = XR_TYPE_VIEW_STATE;
    CHECK(!frameIterable(&bad));
    bad = source.info;
    bad.layers = nullptr;
    CHECK(!frameIterable(&bad));
    bad.layerCount = 0;
    CHECK(frameIterable(&bad) && countProjectionLayers(&bad) == 0);
    CHECK(countProjectionLayers(&source.info) == 3);

    const XrCompositionLayerBaseHeader* out[8]{};
    CHECK(stripProjectionLayers(&source.info, out, 8) == 2);
    CHECK(out[0] == source.layers[3] && out[1] == source.layers[4]);
    CHECK(stripProjectionLayers(&source.info, out, 2) == 2);
    CHECK(stripProjectionLayers(&source.info, out, 1) == UINT32_MAX);  // too small: reported
    CHECK(stripProjectionLayers(&source.info, out, 0) == UINT32_MAX);

    // tails, nulls and out-of-place projections
    std::vector<const XrCompositionLayerBaseHeader*> mix = {
        nullptr, source.layers[3], source.layers[0], nullptr, source.layers[4], source.layers[1]};
    XrFrameEndInfo info = source.info;
    info.layerCount = static_cast<uint32_t>(mix.size());
    info.layers = mix.data();
    CHECK(countProjectionLayers(&info) == 2);
    CHECK(stripProjectionLayers(&info, out, 8) == 2);
    CHECK(out[0] == source.layers[3] && out[1] == source.layers[4]);
    // only projections and nulls => empty result; capacity 0 is fine
    mix = {source.layers[0], source.layers[1], source.layers[2], nullptr};
    info.layerCount = 4;
    info.layers = mix.data();
    CHECK(stripProjectionLayers(&info, out, 0) == 0);
}

}  // namespace

int main() {
    projectionStripping();
    goldenGeometry();
    validators();
    eyeLocate();
    shapeAccepts();
    stockAndForeignShapesAreNotConverted();
    shapeRejects();
    quadsPreserveSourceIdentities();
    processGuard();
    rejectNamesAreDistinct();
    std::cout << "stock_quad_core_tests passed\n";
    return 0;
}
