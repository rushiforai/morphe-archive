.class public final synthetic Ll/tyi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/qcj;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/qcj;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tyi;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/tyi;->b:Ll/qcj;

    iput-object p3, p0, Ll/tyi;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p4, p0, Ll/tyi;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ll/tyi;->e:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tyi;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/tyi;->b:Ll/qcj;

    iget-object v2, p0, Ll/tyi;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v3, p0, Ll/tyi;->d:Ljava/lang/String;

    iget-boolean p0, p0, Ll/tyi;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Ll/rzi;->r(Lcom/p1/mobile/android/app/Act;Ll/qcj;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    return-void
.end method
