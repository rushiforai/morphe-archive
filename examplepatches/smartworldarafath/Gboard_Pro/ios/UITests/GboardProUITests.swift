import XCTest

final class GboardProUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testNavigateCoreAndBetaSettingsOnVirtualDevice() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Gboard Pro Settings"].waitForExistence(timeout: 5))

        // Navigate into Additional -> Choose UI -> Switch to 3D Liquid Glass & back to Classic
        let additionalRow = app.buttons["row_additional"]
        XCTAssertTrue(additionalRow.exists)
        additionalRow.tap()

        XCTAssertTrue(app.buttons["row_choose_ui"].waitForExistence(timeout: 3))
        app.buttons["row_choose_ui"].tap()
        app.buttons["choose_ui_liquid_glass"].tap()
        app.buttons["choose_ui_classic"].tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()

        // Notification screen (3 toggles)
        app.buttons["row_notification"].tap()
        XCTAssertTrue(app.staticTexts["NOTIFICATION PREFERENCES"].waitForExistence(timeout: 3))
        app.navigationBars.buttons.element(boundBy: 0).tap()

        // Beta Program -> Beta version testing & New features (Beta)
        app.buttons["row_beta_program"].tap()
        XCTAssertTrue(app.buttons["row_beta_version_testing"].waitForExistence(timeout: 3))
        app.buttons["row_beta_version_testing"].tap()
        XCTAssertTrue(app.staticTexts["BETA TESTING NOTICE"].waitForExistence(timeout: 3))
        app.navigationBars.buttons.element(boundBy: 0).tap()

        app.buttons["row_new_features_(beta)"].tap()
        let betaSlider = app.switches["toggle_enable_new_features_(beta)"]
        XCTAssertTrue(betaSlider.waitForExistence(timeout: 3))
        betaSlider.tap()
        XCTAssertTrue(app.staticTexts["CURRENTLY TESTING BETA FEATURES"].waitForExistence(timeout: 3))
    }

    func testLiveKeyboardPreviewTyping() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["btn_preview_keyboard"].tap()
        XCTAssertTrue(app.staticTexts["LIVE IPHONE / IPAD KEYBOARD SANDBOX"].waitForExistence(timeout: 4))
    }
}
