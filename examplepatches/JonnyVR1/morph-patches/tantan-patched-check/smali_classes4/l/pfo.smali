.class public final synthetic Ll/pfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/rfo;


# direct methods
.method public synthetic constructor <init>(Ll/rfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pfo;->a:Ll/rfo;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pfo;->a:Ll/rfo;

    invoke-static {p0}, Ll/rfo;->a(Ll/rfo;)Ll/rfo$a;

    move-result-object p0

    return-object p0
.end method
