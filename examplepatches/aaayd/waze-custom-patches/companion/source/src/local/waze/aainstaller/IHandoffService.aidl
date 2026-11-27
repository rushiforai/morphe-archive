package local.waze.aainstaller;
interface IHandoffService {
    String launchInstaller(String token) = 1;
    void destroy() = 16777114;
}
