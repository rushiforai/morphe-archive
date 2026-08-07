.class public final synthetic Ll/i1f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i1f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    iput-object p2, p0, Ll/i1f0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/i1f0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/i1f0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i1f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    iget-object v1, p0, Ll/i1f0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/i1f0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/i1f0;->d:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Link;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->E(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;)V

    return-void
.end method
