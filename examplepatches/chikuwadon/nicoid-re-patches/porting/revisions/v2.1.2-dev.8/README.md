# nicoid Re v2.1.2-dev.8

- One compositor owns normal-playback pager backgrounds while the tab strip and video perimeter keep their existing drawing paths
- Menu glow uses the same video coordinates across page changes and scroll, including when the menu background is transparent or rethemed
- Playback diagnostics record command callers and Media3 state transitions. Error-driven recovery still applies after a source failure
- Explicit Play during network recovery consumes the pending retry immediately and preserves the latest seek target

Device validation is required for Related → Menu, the dev.6 playback stall, and the reported Pixel 9a seek issue.
