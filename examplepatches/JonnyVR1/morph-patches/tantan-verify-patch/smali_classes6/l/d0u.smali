.class public final synthetic Ll/d0u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Frag;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Frag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/d0u;->a:Z

    iput-object p2, p0, Ll/d0u;->b:Lcom/p1/mobile/android/app/Frag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/d0u;->a:Z

    iget-object p0, p0, Ll/d0u;->b:Lcom/p1/mobile/android/app/Frag;

    check-cast p1, Lcom/p1/mobile/putong/live/base/util/IntSet;

    invoke-static {v0, p0, p1}, Ll/j0u;->s0(ZLcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/live/base/util/IntSet;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
