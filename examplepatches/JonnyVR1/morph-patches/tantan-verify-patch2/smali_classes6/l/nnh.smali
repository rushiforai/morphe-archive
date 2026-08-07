.class public final synthetic Ll/nnh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/snh;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/snh;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nnh;->a:Ll/snh;

    iput-object p2, p0, Ll/nnh;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/nnh;->c:Lcom/p1/mobile/putong/data/Media;

    iput-boolean p4, p0, Ll/nnh;->d:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nnh;->a:Ll/snh;

    iget-object v1, p0, Ll/nnh;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/nnh;->c:Lcom/p1/mobile/putong/data/Media;

    iget-boolean p0, p0, Ll/nnh;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/snh;->b(Ll/snh;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V

    return-void
.end method
