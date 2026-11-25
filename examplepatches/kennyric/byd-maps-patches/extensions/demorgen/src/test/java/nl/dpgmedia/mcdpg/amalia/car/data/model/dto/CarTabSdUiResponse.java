package nl.dpgmedia.mcdpg.amalia.car.data.model.dto;

import java.util.List;

/** Test double with the production constructor and getter signatures. */
public final class CarTabSdUiResponse {
    private final List<Component> components;

    public CarTabSdUiResponse(List<Component> components) {
        this.components = components;
    }

    public List<Component> getComponents() {
        return components;
    }

    public static final class Component {
        private final String componentName;
        private final List<?> content;
        private final Integer id;
        private final String title;

        public Component(String componentName, List<?> content, Integer id, String title) {
            this.componentName = componentName;
            this.content = content;
            this.id = id;
            this.title = title;
        }

        public String getComponentName() {
            return componentName;
        }

        public List<?> getContent() {
            return content;
        }

        public Integer getId() {
            return id;
        }

        public String getTitle() {
            return title;
        }
    }
}
