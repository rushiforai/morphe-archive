.class public final synthetic Ll/xzk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VTexturePlayer;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lv/VTexturePlayer;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xzk0;->a:Lv/VTexturePlayer;

    iput-object p2, p0, Ll/xzk0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzk0;->a:Lv/VTexturePlayer;

    iget-object p0, p0, Ll/xzk0;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lv/VTexturePlayer;->d(Lv/VTexturePlayer;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
