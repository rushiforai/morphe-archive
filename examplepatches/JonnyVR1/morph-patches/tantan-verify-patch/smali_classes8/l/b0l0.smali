.class public final synthetic Ll/b0l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/azl;


# direct methods
.method public synthetic constructor <init>(Ll/azl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b0l0;->a:Ll/azl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b0l0;->a:Ll/azl;

    invoke-static {p0}, Lv/VTexturePlayer;->e(Ll/azl;)V

    return-void
.end method
