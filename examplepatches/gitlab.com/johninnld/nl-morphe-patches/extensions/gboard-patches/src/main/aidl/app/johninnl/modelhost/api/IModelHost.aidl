package app.johninnl.modelhost.api;
import app.johninnl.modelhost.api.IModelSession;
import app.johninnl.modelhost.api.IHostEvents;
import app.johninnl.modelhost.api.ISpeechSession;
interface IModelHost {
    int apiVersion();
    String capabilitiesJson();
    String statusJson();
    IModelSession openSession(String configJson, IHostEvents events);
    ISpeechSession openSpeechSession(String configJson, IHostEvents events);
}
