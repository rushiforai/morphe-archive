.class public final synthetic Ll/nee0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/pee0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/pee0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nee0;->a:Ll/pee0;

    iput-object p2, p0, Ll/nee0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nee0;->a:Ll/pee0;

    iget-object p0, p0, Ll/nee0;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Ll/pee0;->k(Ll/pee0;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
