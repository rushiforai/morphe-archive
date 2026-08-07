.class public final synthetic Ll/l5l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerificationToken;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l5l0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/l5l0;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    iput-object p3, p0, Ll/l5l0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l5l0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/l5l0;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    iget-object p0, p0, Ll/l5l0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/q5l0;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)V

    return-void
.end method
