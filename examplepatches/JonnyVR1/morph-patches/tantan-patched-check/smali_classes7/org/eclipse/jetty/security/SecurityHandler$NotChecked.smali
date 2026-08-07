.class public Lorg/eclipse/jetty/security/SecurityHandler$NotChecked;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/security/Principal;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/security/SecurityHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NotChecked"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/security/SecurityHandler;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/security/SecurityHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/security/SecurityHandler$NotChecked;->this$0:Lorg/eclipse/jetty/security/SecurityHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getSecurityHandler()Lorg/eclipse/jetty/security/SecurityHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/security/SecurityHandler$NotChecked;->this$0:Lorg/eclipse/jetty/security/SecurityHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "NOT CHECKED"

    .line 2
    .line 3
    return-object p0
.end method
