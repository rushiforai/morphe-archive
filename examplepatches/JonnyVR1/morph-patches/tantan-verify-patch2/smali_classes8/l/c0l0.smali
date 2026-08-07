.class public final synthetic Ll/c0l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VTexturePlayer;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lv/VTexturePlayer;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c0l0;->a:Lv/VTexturePlayer;

    iput p2, p0, Ll/c0l0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c0l0;->a:Lv/VTexturePlayer;

    iget p0, p0, Ll/c0l0;->b:I

    invoke-static {v0, p0}, Lv/VTexturePlayer;->a(Lv/VTexturePlayer;I)V

    return-void
.end method
