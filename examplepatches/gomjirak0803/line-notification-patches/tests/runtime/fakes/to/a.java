package to;

public class a {
    protected Object model;
    protected co.l strategy;
    protected Boolean onlyCache;
    protected int overrideWidth = -1;
    protected int overrideHeight = -1;
    protected boolean circleCrop;

    public a g(co.l strategy) {
        this.strategy = strategy;
        return this;
    }

    public a r(boolean onlyCache) {
        this.onlyCache = Boolean.valueOf(onlyCache);
        return this;
    }

    public a t(int width, int height) {
        this.overrideWidth = width;
        this.overrideHeight = height;
        return this;
    }

    public a d() {
        this.circleCrop = true;
        return this;
    }
}
