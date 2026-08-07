.class public final synthetic Ll/c0u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Frag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Frag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c0u;->a:Lcom/p1/mobile/android/app/Frag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c0u;->a:Lcom/p1/mobile/android/app/Frag;

    check-cast p1, Lcom/p1/mobile/putong/live/base/util/IntSet;

    invoke-static {p0, p1}, Ll/j0u;->v0(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/live/base/util/IntSet;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
