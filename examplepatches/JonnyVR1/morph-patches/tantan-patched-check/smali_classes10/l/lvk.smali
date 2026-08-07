.class public final synthetic Ll/lvk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qvk;


# direct methods
.method public synthetic constructor <init>(Ll/qvk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lvk;->a:Ll/qvk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lvk;->a:Ll/qvk;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/qvk;->R3(Ll/qvk;Ljava/lang/String;)V

    return-void
.end method
