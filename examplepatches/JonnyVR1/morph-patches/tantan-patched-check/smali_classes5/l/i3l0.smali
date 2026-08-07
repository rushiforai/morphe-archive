.class public final synthetic Ll/i3l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/o3l0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

.field public final synthetic e:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i3l0;->a:Ll/o3l0;

    iput-object p2, p0, Ll/i3l0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/i3l0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/i3l0;->d:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    iput-object p5, p0, Ll/i3l0;->e:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    iput-object p6, p0, Ll/i3l0;->f:Ljava/lang/String;

    iput p7, p0, Ll/i3l0;->g:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/i3l0;->a:Ll/o3l0;

    iget-object v1, p0, Ll/i3l0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/i3l0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/i3l0;->d:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    iget-object v4, p0, Ll/i3l0;->e:Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;

    iget-object v5, p0, Ll/i3l0;->f:Ljava/lang/String;

    iget v6, p0, Ll/i3l0;->g:I

    invoke-static/range {v0 .. v6}, Ll/o3l0;->b(Ll/o3l0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/p1/mobile/putong/facertification/TTFacertificationClient$a;Ljava/lang/String;I)V

    return-void
.end method
