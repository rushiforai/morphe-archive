.class public final synthetic Ll/cmh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Ll/z20;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cmh0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-boolean p2, p0, Ll/cmh0;->b:Z

    iput-object p3, p0, Ll/cmh0;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/cmh0;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/cmh0;->e:Ll/z20;

    iput-object p6, p0, Ll/cmh0;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cmh0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-boolean v1, p0, Ll/cmh0;->b:Z

    iget-object v2, p0, Ll/cmh0;->c:Lcom/p1/mobile/putong/data/User;

    iget-object v3, p0, Ll/cmh0;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/cmh0;->e:Ll/z20;

    iget-object v5, p0, Ll/cmh0;->f:Ll/x20;

    invoke-static/range {v0 .. v5}, Ll/imh0;->b(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)V

    return-void
.end method
