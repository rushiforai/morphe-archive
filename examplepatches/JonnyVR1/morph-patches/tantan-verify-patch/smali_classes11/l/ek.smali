.class public final synthetic Ll/ek;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/lk;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/lk;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ek;->a:Ll/lk;

    iput-boolean p2, p0, Ll/ek;->b:Z

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ek;->a:Ll/lk;

    iget-boolean p0, p0, Ll/ek;->b:Z

    invoke-static {v0, p0}, Ll/lk;->k0(Ll/lk;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
