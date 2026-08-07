.class public Lorg/eclipse/jetty/security/ConstraintMapping;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field _constraint:Lorg/eclipse/jetty/util/security/Constraint;

.field _method:Ljava/lang/String;

.field _methodOmissions:[Ljava/lang/String;

.field _pathSpec:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getConstraint()Lorg/eclipse/jetty/util/security/Constraint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/ConstraintMapping;->_constraint:Lorg/eclipse/jetty/util/security/Constraint;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/ConstraintMapping;->_method:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMethodOmissions()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/ConstraintMapping;->_methodOmissions:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPathSpec()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/ConstraintMapping;->_pathSpec:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setConstraint(Lorg/eclipse/jetty/util/security/Constraint;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/ConstraintMapping;->_constraint:Lorg/eclipse/jetty/util/security/Constraint;

    .line 2
    .line 3
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/ConstraintMapping;->_method:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMethodOmissions([Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/ConstraintMapping;->_methodOmissions:[Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPathSpec(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/ConstraintMapping;->_pathSpec:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
