package app.voidhack.extension.applemusic;

final class GlassSpring {
    private final float stiffness;
    private final float damping;
    private final float tolerance;
    float value;
    float target;
    float velocity;

    GlassSpring(float stiffness, float dampingRatio, float tolerance) {
        this.stiffness = stiffness;
        damping = 2f * dampingRatio * (float) Math.sqrt(stiffness);
        this.tolerance = tolerance;
    }

    void snap(float destination) {
        value = target = destination;
        velocity = 0f;
    }

    boolean advance(float seconds) {
        int steps = Math.max(1, (int) Math.ceil(seconds / 0.004f));
        float dt = seconds / steps;
        for (int i = 0; i < steps; i++) {
            velocity += (stiffness * (target - value) - damping * velocity) * dt;
            value += velocity * dt;
        }
        if (Math.abs(target - value) < tolerance && Math.abs(velocity) < tolerance * 20f) {
            snap(target);
            return false;
        }
        return true;
    }
}
