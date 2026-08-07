.class public Lorg/eclipse/jetty/security/RoleInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _checked:Z

.field private _forbidden:Z

.field private _isAnyRole:Z

.field private final _roles:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _userDataConstraint:Lorg/eclipse/jetty/security/UserDataConstraint;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_roles:Ljava/util/Set;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public addRole(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_roles:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public combine(Lorg/eclipse/jetty/security/RoleInfo;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lorg/eclipse/jetty/security/RoleInfo;->_forbidden:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/security/RoleInfo;->setForbidden(Z)V

    .line 7
    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-boolean v0, p1, Lorg/eclipse/jetty/security/RoleInfo;->_checked:Z

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/security/RoleInfo;->setChecked(Z)V

    .line 15
    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    iget-boolean v0, p1, Lorg/eclipse/jetty/security/RoleInfo;->_isAnyRole:Z

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/security/RoleInfo;->setAnyRole(Z)V

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    iget-boolean v0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_isAnyRole:Z

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iget-object v0, p1, Lorg/eclipse/jetty/security/RoleInfo;->_roles:Ljava/util/Set;

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ljava/lang/String;

    .line 47
    .line 48
    iget-object v2, p0, Lorg/eclipse/jetty/security/RoleInfo;->_roles:Ljava/util/Set;

    .line 49
    .line 50
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    :goto_1
    iget-object p1, p1, Lorg/eclipse/jetty/security/RoleInfo;->_userDataConstraint:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/security/RoleInfo;->setUserDataConstraint(Lorg/eclipse/jetty/security/UserDataConstraint;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public getRoles()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_roles:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserDataConstraint()Lorg/eclipse/jetty/security/UserDataConstraint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_userDataConstraint:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAnyRole()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_isAnyRole:Z

    .line 2
    .line 3
    return p0
.end method

.method public isChecked()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_checked:Z

    .line 2
    .line 3
    return p0
.end method

.method public isForbidden()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_forbidden:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAnyRole(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_isAnyRole:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_checked:Z

    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_roles:Ljava/util/Set;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_checked:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_forbidden:Z

    .line 7
    .line 8
    iget-object v0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_roles:Ljava/util/Set;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 11
    .line 12
    .line 13
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_isAnyRole:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setForbidden(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_forbidden:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_checked:Z

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_userDataConstraint:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_isAnyRole:Z

    .line 13
    .line 14
    iget-object p0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_roles:Ljava/util/Set;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public setUserDataConstraint(Lorg/eclipse/jetty/security/UserDataConstraint;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_userDataConstraint:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_userDataConstraint:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/security/UserDataConstraint;->combine(Lorg/eclipse/jetty/security/UserDataConstraint;)Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_userDataConstraint:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    const-string p0, "Null UserDataConstraint"

    .line 18
    .line 19
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{RoleInfo"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_forbidden:Z

    .line 9
    .line 10
    const-string v2, ""

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const-string v1, ",F"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object v1, v2

    .line 18
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_checked:Z

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const-string v2, ",C"

    .line 26
    .line 27
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-boolean v1, p0, Lorg/eclipse/jetty/security/RoleInfo;->_isAnyRole:Z

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    const-string p0, ",*"

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    iget-object p0, p0, Lorg/eclipse/jetty/security/RoleInfo;->_roles:Ljava/util/Set;

    .line 38
    .line 39
    :goto_1
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p0, "}"

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method
