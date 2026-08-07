.class public final synthetic Ll/ov90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/aw90;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/NewTags;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/aw90;Lcom/p1/mobile/putong/core/data/NewTags;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ov90;->a:Ll/aw90;

    iput-object p2, p0, Ll/ov90;->b:Lcom/p1/mobile/putong/core/data/NewTags;

    iput-object p3, p0, Ll/ov90;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/ov90;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ov90;->a:Ll/aw90;

    iget-object v1, p0, Ll/ov90;->b:Lcom/p1/mobile/putong/core/data/NewTags;

    iget-object v2, p0, Ll/ov90;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/ov90;->d:Ljava/lang/String;

    move v4, p1

    move v5, p2

    move-object v6, p3

    invoke-static/range {v0 .. v6}, Ll/aw90;->p(Ll/aw90;Lcom/p1/mobile/putong/core/data/NewTags;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
