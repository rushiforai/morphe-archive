.class public final synthetic Ll/rv90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aw90;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/aw90;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rv90;->a:Ll/aw90;

    iput-object p2, p0, Ll/rv90;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/rv90;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rv90;->a:Ll/aw90;

    iget-object v1, p0, Ll/rv90;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/rv90;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, p0, p1}, Ll/aw90;->e(Ll/aw90;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
