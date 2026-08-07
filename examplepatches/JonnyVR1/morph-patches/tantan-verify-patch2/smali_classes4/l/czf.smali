.class public final synthetic Ll/czf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/FakeGuideData;

.field public final synthetic d:Ll/jl80;

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/FakeGuideData;Ll/jl80;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/czf;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/czf;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/czf;->c:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    iput-object p4, p0, Ll/czf;->d:Ll/jl80;

    iput-object p5, p0, Ll/czf;->e:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/czf;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/czf;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/czf;->c:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    iget-object v3, p0, Ll/czf;->d:Ll/jl80;

    iget-object v4, p0, Ll/czf;->e:Lcom/p1/mobile/android/app/Act;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/a0g;->z(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/FakeGuideData;Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
