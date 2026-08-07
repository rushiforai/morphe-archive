.class public final synthetic Ll/dmh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Z

.field public final synthetic c:Ll/z20;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLl/z20;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dmh0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-boolean p2, p0, Ll/dmh0;->b:Z

    iput-object p3, p0, Ll/dmh0;->c:Ll/z20;

    iput-object p4, p0, Ll/dmh0;->d:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dmh0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-boolean v1, p0, Ll/dmh0;->b:Z

    iget-object v2, p0, Ll/dmh0;->c:Ll/z20;

    iget-object p0, p0, Ll/dmh0;->d:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, v2, p0, p1}, Ll/imh0;->a(Lcom/p1/mobile/putong/core/newui/home/d;ZLl/z20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
