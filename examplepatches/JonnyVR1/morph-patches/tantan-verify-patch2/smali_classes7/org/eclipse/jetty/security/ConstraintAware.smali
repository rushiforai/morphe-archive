.class public interface abstract Lorg/eclipse/jetty/security/ConstraintAware;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract addConstraintMapping(Lorg/eclipse/jetty/security/ConstraintMapping;)V
.end method

.method public abstract addRole(Ljava/lang/String;)V
.end method

.method public abstract getConstraintMappings()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/eclipse/jetty/security/ConstraintMapping;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRoles()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setConstraintMappings(Ljava/util/List;Ljava/util/Set;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/eclipse/jetty/security/ConstraintMapping;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
