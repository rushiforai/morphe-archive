.class public final synthetic Ll/sb60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/dc60;


# direct methods
.method public synthetic constructor <init>(Ll/dc60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sb60;->a:Ll/dc60;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sb60;->a:Ll/dc60;

    invoke-static {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->n(Ll/dc60;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
