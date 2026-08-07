.class public final synthetic Ll/y3l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d4l0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/VerificationToken;

.field public final synthetic d:Ll/kxf;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Lcom/p1/mobile/putong/facertification/RxFacertification$b;


# direct methods
.method public synthetic constructor <init>(Ll/d4l0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ll/kxf;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y3l0;->a:Ll/d4l0;

    iput-object p2, p0, Ll/y3l0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/y3l0;->c:Lcom/p1/mobile/putong/data/VerificationToken;

    iput-object p4, p0, Ll/y3l0;->d:Ll/kxf;

    iput-object p5, p0, Ll/y3l0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/y3l0;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/y3l0;->g:Ljava/lang/String;

    iput-object p8, p0, Ll/y3l0;->h:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/y3l0;->a:Ll/d4l0;

    iget-object v1, p0, Ll/y3l0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/y3l0;->c:Lcom/p1/mobile/putong/data/VerificationToken;

    iget-object v3, p0, Ll/y3l0;->d:Ll/kxf;

    iget-object v4, p0, Ll/y3l0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/y3l0;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/y3l0;->g:Ljava/lang/String;

    iget-object v7, p0, Ll/y3l0;->h:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    move-object v8, p1

    check-cast v8, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v8}, Ll/d4l0;->b(Ll/d4l0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ll/kxf;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
