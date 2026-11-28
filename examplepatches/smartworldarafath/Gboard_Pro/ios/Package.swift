// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GboardProiOS",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "GboardProShared",
            targets: ["GboardProShared"]
        )
    ],
    targets: [
        .target(
            name: "GboardProShared",
            path: "Sources/Shared"
        )
    ]
)
