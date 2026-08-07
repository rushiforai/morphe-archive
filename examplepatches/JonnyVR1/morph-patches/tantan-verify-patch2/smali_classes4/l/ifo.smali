.class public final synthetic Ll/ifo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lfo;


# direct methods
.method public synthetic constructor <init>(Ll/lfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ifo;->a:Ll/lfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ifo;->a:Ll/lfo;

    check-cast p1, Lkotlin/Pair;

    invoke-static {p0, p1}, Ll/lfo;->j0(Ll/lfo;Lkotlin/Pair;)V

    return-void
.end method
