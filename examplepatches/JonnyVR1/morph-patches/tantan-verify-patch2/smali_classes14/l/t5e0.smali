.class public final synthetic Ll/t5e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v5e0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/v5e0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5e0;->a:Ll/v5e0;

    iput-object p2, p0, Ll/t5e0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/t5e0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/t5e0;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ll/t5e0;->e:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/t5e0;->a:Ll/v5e0;

    iget-object v1, p0, Ll/t5e0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/t5e0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/t5e0;->d:Ljava/lang/String;

    iget-boolean v4, p0, Ll/t5e0;->e:Z

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;

    invoke-static/range {v0 .. v5}, Ll/v5e0;->f(Ll/v5e0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;)V

    return-void
.end method
