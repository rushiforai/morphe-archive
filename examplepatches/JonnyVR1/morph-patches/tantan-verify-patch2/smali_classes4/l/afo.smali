.class public final synthetic Ll/afo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/cfo;


# direct methods
.method public synthetic constructor <init>(Ll/cfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/afo;->a:Ll/cfo;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/afo;->a:Ll/cfo;

    invoke-static {p0}, Ll/cfo;->a(Ll/cfo;)Ll/cfo$a;

    move-result-object p0

    return-object p0
.end method
