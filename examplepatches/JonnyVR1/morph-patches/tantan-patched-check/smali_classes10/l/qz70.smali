.class public final synthetic Ll/qz70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/rz70;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/rz70;Ljava/lang/String;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qz70;->a:Ll/rz70;

    iput-object p2, p0, Ll/qz70;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/qz70;->c:Z

    iput-object p4, p0, Ll/qz70;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qz70;->a:Ll/rz70;

    iget-object v1, p0, Ll/qz70;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/qz70;->c:Z

    iget-object p0, p0, Ll/qz70;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0}, Ll/rz70;->r4(Ll/rz70;Ljava/lang/String;ZLl/y20;)V

    return-void
.end method
