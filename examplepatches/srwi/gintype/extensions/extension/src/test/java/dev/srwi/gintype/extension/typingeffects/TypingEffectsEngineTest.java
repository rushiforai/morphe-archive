package dev.srwi.gintype.extension.typingeffects;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Random;

public class TypingEffectsEngineTest {

    private static TypingEffectsConfig configWith(
            boolean enabled,
            boolean rainbowTrail,
            boolean trailGlow,
            boolean glitter,
            boolean tapExplosion,
            boolean releaseExplosion,
            boolean shockwaveRing,
            boolean keyHighlight,
            String palette,
            String explosionStyle,
            String glitterStyle,
            String keyHighlightStyle,
            int particleCount) {
        return new TypingEffectsConfig(
                enabled,
                rainbowTrail,
                trailGlow,
                glitter,
                tapExplosion,
                releaseExplosion,
                shockwaveRing,
                keyHighlight,
                false,
                false,
                palette,
                explosionStyle,
                glitterStyle,
                keyHighlightStyle,
                12, 360, 150, particleCount, 5, 100, 520, 100, 380, 100, 115, 5, 68);
    }

    @Test
    public void tapSpawnsExplosionAndShockwaveRingWithoutTrail() {
        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(42L));
        engine.setConfig(TypingEffectsConfig.defaults());

        engine.onPointerDown(0, 100f, 200f, 1000L);
        engine.onPointerUp(0, 102f, 201f, 1060L);

        assertEquals("Tap should spawn configured particle burst",
                GboardTypingEffectsSettings.DEFAULT_PARTICLE_COUNT,
                engine.getParticles().size());
        assertEquals("Tap should spawn shockwave ring when enabled",
                1,
                engine.getRings().size());
        assertTrue("Tap should not leave a fading swipe trail",
                engine.collectRenderableTrails().isEmpty());
        assertTrue(engine.hasActiveEffects());
    }

    @Test
    public void swipeGeneratesRainbowTrailGlitterAndReleaseExplosion() {
        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(7L));
        engine.setConfig(TypingEffectsConfig.defaults());

        engine.onPointerDown(0, 50f, 150f, 1000L);
        engine.onPointerMove(0, 110f, 150f, 1016L);
        engine.onPointerMove(0, 180f, 160f, 1032L);
        engine.onPointerMove(0, 260f, 175f, 1048L);

        assertEquals("Active swipe should expose 1 renderable trail",
                1, engine.collectRenderableTrails().size());
        int glitterCount = engine.getParticles().size();
        assertTrue("Swipe should emit glitter particles, got " + glitterCount,
                glitterCount > 0);

        engine.onPointerUp(0, 260f, 175f, 1064L);
        assertTrue("Release explosion should add burst particles beyond glitter",
                engine.getParticles().size() > glitterCount);
        assertEquals("Swipe release should spawn a shockwave ring",
                1, engine.getRings().size());
        assertEquals("Released swipe trail should fade gracefully",
                1, engine.collectRenderableTrails().size());
    }

    @Test
    public void multiPointerSwipesTrackIndependentTrailsSimultaneously() {
        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(99L));
        engine.setConfig(TypingEffectsConfig.defaults());

        engine.onPointerDown(0, 40f, 120f, 1000L);
        engine.onPointerDown(1, 300f, 120f, 1004L);
        engine.onPointerMove(0, 100f, 140f, 1020L);
        engine.onPointerMove(1, 240f, 150f, 1020L);
        engine.onPointerMove(0, 150f, 160f, 1036L);
        engine.onPointerMove(1, 190f, 170f, 1036L);

        assertEquals("Two-finger MultiGlide should render 2 simultaneous trails",
                2, engine.collectRenderableTrails().size());
    }

    @Test
    public void individualFeatureTogglesDisableEachEffectIndependently() {
        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(1L));

        // Only rainbow trail enabled: no glitter, no tap explosion, no release explosion, no ring, no key glow.
        engine.setConfig(configWith(
                true, true, true, false, false, false, false, false,
                TypingEffectsConfig.PALETTE_RAINBOW,
                TypingEffectsConfig.EXPLOSION_STYLE_SPARKS_RING,
                TypingEffectsConfig.GLITTER_STYLE_SPARKLES,
                TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_NEON_GLOW,
                20));

        engine.onPointerDown(0, 10f, 10f, 100L);
        engine.onKeyTouched(101, 0f, 0f, 50f, 60f, 100L);
        engine.onPointerUp(0, 11f, 11f, 120L);
        assertTrue("Tap explosion disabled -> 0 particles", engine.getParticles().isEmpty());
        assertTrue("Shockwave ring disabled -> 0 rings", engine.getRings().isEmpty());
        assertTrue("Key highlight disabled -> 0 key highlights", engine.getKeyHighlights().isEmpty());

        engine.onPointerDown(1, 10f, 10f, 200L);
        engine.onPointerMove(1, 90f, 10f, 220L);
        engine.onPointerMove(1, 180f, 10f, 240L);
        assertEquals(1, engine.collectRenderableTrails().size());
        assertTrue("Glitter disabled -> 0 particles during swipe", engine.getParticles().isEmpty());
        engine.onPointerUp(1, 180f, 10f, 260L);
        assertTrue("Release explosion disabled -> 0 particles on lift", engine.getParticles().isEmpty());
    }

    @Test
    public void keyTouchHighlightRefreshesSameKeyAndExpiresCleanly() {
        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(21L));
        engine.setConfig(configWith(
                true, false, false, false, false, false, false, true,
                TypingEffectsConfig.PALETTE_NEON,
                TypingEffectsConfig.EXPLOSION_STYLE_SPARKS_RING,
                TypingEffectsConfig.GLITTER_STYLE_SPARKLES,
                TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_PLASMA_PULSE,
                20));

        engine.onKeyTouched(1, 10f, 20f, 70f, 90f, 1000L);
        engine.onKeyTouched(1, 10f, 20f, 70f, 90f, 1100L);
        engine.onKeyTouched(2, 80f, 20f, 140f, 90f, 1150L);

        assertEquals("Touching the same key twice should refresh instead of duplicating",
                2, engine.getKeyHighlights().size());
        assertEquals(1100L, engine.getKeyHighlights().get(0).lastTouchedMs);
        assertTrue(engine.hasActiveEffects());

        // Still active shortly after touch
        assertTrue(engine.step(1250L));
        assertEquals(2, engine.getKeyHighlights().size());

        // Expired after duration elapses (380ms after 1150ms = 1530ms)
        assertFalse(engine.step(1600L));
        assertTrue(engine.getKeyHighlights().isEmpty());
    }

    @Test
    public void masterToggleOffProducesNoEffects() {
        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(5L));
        engine.setConfig(configWith(
                false, true, true, true, true, true, true, true,
                TypingEffectsConfig.PALETTE_NEON,
                TypingEffectsConfig.EXPLOSION_STYLE_ALL_OUT,
                TypingEffectsConfig.GLITTER_STYLE_MIXED,
                TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_NEON_GLOW,
                20));

        engine.onPointerDown(0, 50f, 50f, 100L);
        engine.onKeyTouched(42, 30f, 30f, 90f, 90f, 100L);
        engine.onPointerMove(0, 200f, 50f, 120L);
        engine.onPointerUp(0, 200f, 50f, 140L);

        assertFalse(engine.hasActiveEffects());
        assertTrue(engine.getParticles().isEmpty());
        assertTrue(engine.getRings().isEmpty());
        assertTrue(engine.getKeyHighlights().isEmpty());
        assertTrue(engine.collectRenderableTrails().isEmpty());
    }

    @Test
    public void stepExpiresAllParticlesRingsTrailsAndKeyHighlightsCleanly() {
        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(13L));
        engine.setConfig(TypingEffectsConfig.defaults());

        engine.onPointerDown(0, 20f, 20f, 1000L);
        engine.onKeyTouched(9, 10f, 10f, 50f, 50f, 1000L);
        engine.onPointerMove(0, 120f, 20f, 1020L);
        engine.onPointerUp(0, 120f, 20f, 1040L);
        assertTrue(engine.hasActiveEffects());

        // Advance well past maximum lifetime and trail fade duration.
        boolean stillActive = engine.step(4000L);
        assertFalse("All effects should expire after lifetime elapses", stillActive);
        assertTrue(engine.getParticles().isEmpty());
        assertTrue(engine.getRings().isEmpty());
        assertTrue(engine.getKeyHighlights().isEmpty());
        assertTrue(engine.collectRenderableTrails().isEmpty());
    }

    @Test
    public void colorPalettesSampleDistinctOpaqueColors() {
        String[] palettes = {
                TypingEffectsConfig.PALETTE_RAINBOW,
                TypingEffectsConfig.PALETTE_NEON,
                TypingEffectsConfig.PALETTE_FIRE,
                TypingEffectsConfig.PALETTE_GALAXY,
                TypingEffectsConfig.PALETTE_PASTEL
        };
        for (String palette : palettes) {
            TypingEffectsConfig cfg = configWith(
                    true, true, true, true, true, true, true, true,
                    palette,
                    TypingEffectsConfig.EXPLOSION_STYLE_ALL_OUT,
                    TypingEffectsConfig.GLITTER_STYLE_MIXED,
                    TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_NEON_GLOW,
                    20);
            int c0 = cfg.sampleColor(0.0f);
            int c1 = cfg.sampleColor(0.35f);
            assertEquals(0xFF, (c0 >>> 24) & 0xFF);
            assertEquals(0xFF, (c1 >>> 24) & 0xFF);
            assertNotEquals("Palette " + palette + " should vary across phases", c0, c1);
        }
    }

    @Test
    public void explosionStylesProduceExpectedParticleShapes() {
        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(3L));

        // Confetti only
        engine.setConfig(configWith(
                true, false, false, false, true, false, false, false,
                TypingEffectsConfig.PALETTE_RAINBOW,
                TypingEffectsConfig.EXPLOSION_STYLE_CONFETTI,
                TypingEffectsConfig.GLITTER_STYLE_SPARKLES,
                TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_NEON_GLOW,
                12));
        engine.onPointerDown(0, 100f, 100f, 100L);
        engine.onPointerUp(0, 100f, 100f, 120L);
        assertEquals(12, engine.getParticles().size());
        for (TypingEffectsEngine.Particle p : engine.getParticles()) {
            assertEquals(TypingEffectsEngine.SHAPE_CONFETTI, p.shape);
        }

        // All-out show mix includes all 3 shapes
        engine.clearAll();
        engine.setConfig(configWith(
                true, false, false, false, true, false, true, false,
                TypingEffectsConfig.PALETTE_RAINBOW,
                TypingEffectsConfig.EXPLOSION_STYLE_ALL_OUT,
                TypingEffectsConfig.GLITTER_STYLE_MIXED,
                TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_NEON_GLOW,
                18));
        engine.onPointerDown(0, 100f, 100f, 200L);
        engine.onPointerUp(0, 100f, 100f, 220L);
        boolean hasSpark = false;
        boolean hasStar = false;
        boolean hasConfetti = false;
        for (TypingEffectsEngine.Particle p : engine.getParticles()) {
            if (p.shape == TypingEffectsEngine.SHAPE_SPARK) hasSpark = true;
            if (p.shape == TypingEffectsEngine.SHAPE_STAR) hasStar = true;
            if (p.shape == TypingEffectsEngine.SHAPE_CONFETTI) hasConfetti = true;
        }
        assertTrue(hasSpark);
        assertTrue(hasStar);
        assertTrue(hasConfetti);
    }

    @Test
    public void trampolineKeyboardWarpMeshPinsEdgesPullsInteriorAndRebounds() {
        TypingEffectsConfig defaults = TypingEffectsConfig.defaults();
        assertFalse("Keyboard warp should be disabled by default", defaults.keyboardWarpEnabled);

        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(11L));
        engine.setConfig(new TypingEffectsConfig(
                defaults.enabled,
                defaults.rainbowTrailEnabled,
                defaults.trailGlowEnabled,
                defaults.glitterEnabled,
                defaults.tapExplosionEnabled,
                defaults.releaseExplosionEnabled,
                defaults.shockwaveRingEnabled,
                defaults.keyHighlightEnabled,
                true,
                defaults.windEnabled,
                defaults.colorPalette,
                defaults.explosionStyle,
                defaults.glitterStyle,
                defaults.keyHighlightStyle,
                defaults.trailWidthDp,
                defaults.trailFadeMs,
                defaults.rainbowSpeedPercent,
                defaults.particleCount,
                defaults.glitterDensity,
                defaults.particleSizePercent,
                defaults.particleLifetimeMs,
                defaults.particleSpeedPercent,
                defaults.keyHighlightDurationMs,
                defaults.warpStrengthPercent,
                defaults.warpRadiusDp,
                defaults.windIntensity,
                defaults.windSpreadDp));

        int w = 800;
        int h = 400;
        int cols = 16;
        int rows = 8;
        int count = (cols + 1) * (rows + 1);
        float[] verts = new float[count * 2];
        int[] colors = new int[count];

        engine.onPointerDown(0, 400f, 200f, 1000L);
        assertTrue(engine.hasActiveWarp());
        assertTrue(engine.fillTrampolineMesh(w, h, cols, rows, 1000L, verts, colors));

        // Top-left corner (0, 0) must stay pinned at (0, 0)
        assertEquals(0f, verts[0], 0.001f);
        assertEquals(0f, verts[1], 0.001f);

        // Interior vertex slightly left of center (col=6, row=4 -> baseX=300, baseY=200)
        // should be pulled right toward 400 and slightly downward
        int idxLeft = 4 * (cols + 1) + 6;
        assertTrue("Interior vertex left of press should pull right", verts[idxLeft * 2] > 300f);
        assertTrue("Interior vertex should dip downward", verts[idxLeft * 2 + 1] > 200f);

        // Center vertex (col=8, row=4) should be shaded slightly darker for 3D dimple depth
        int idxCenter = 4 * (cols + 1) + 8;
        assertTrue("Center vertex should have subtle dimple shading",
                (colors[idxCenter] & 0xFF) < 255);

        // Release triggers damped trampoline rebound and eventually settles cleanly
        engine.onPointerUp(0, 400f, 200f, 1050L);
        assertTrue(engine.hasActiveWarp());
        assertFalse("Warp spring should finish cleanly after duration", engine.step(2000L));
        assertFalse(engine.hasActiveWarp());
    }

    @Test
    public void swipeEmitsAmbientWindStreamsThatFlowAlongTrajectoryAndExpire() {
        TypingEffectsEngine engine = new TypingEffectsEngine(2.0f, new Random(19L));
        engine.setConfig(TypingEffectsConfig.defaults());

        engine.onPointerDown(0, 40f, 160f, 1000L);
        engine.onPointerMove(0, 120f, 160f, 1016L);
        engine.onPointerMove(0, 220f, 165f, 1032L);
        engine.onPointerMove(0, 340f, 170f, 1048L);

        assertFalse("Swiping should emit ambient wind streams", engine.getWindStreams().isEmpty());
        TypingEffectsEngine.WindStream sample = engine.getWindStreams().get(0);
        assertTrue("Wind should generally flow rightward with rightward swipe", sample.vx > 0f);

        // Stepping builds curved ribbon points
        engine.step(1064L);
        engine.step(1080L);
        assertTrue("Stepping should extend wind stream points", sample.pointCount >= 3);

        // Release and advance past lifetime -> all wind streams expire cleanly
        engine.onPointerUp(0, 340f, 170f, 1096L);
        assertFalse(engine.step(3000L));
        assertTrue(engine.getWindStreams().isEmpty());
    }
}
