package nl.persgroep.edition.overview.domain.model;

import java.util.List;

/** Test double with the production class name checked by the group walk. */
public abstract class OverviewPageComponent {
    public static final class Group extends OverviewPageComponent {
        private final List<?> blocks;

        public Group(List<?> blocks) {
            this.blocks = blocks;
        }

        public List<?> getBlocks() {
            return blocks;
        }
    }
}
