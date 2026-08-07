.class public final synthetic Ll/njm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/sjm0;


# direct methods
.method public synthetic constructor <init>(Ll/sjm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/njm0;->a:Ll/sjm0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/njm0;->a:Ll/sjm0;

    invoke-static {p0}, Ll/sjm0;->b(Ll/sjm0;)Ll/sjm0$a;

    move-result-object p0

    return-object p0
.end method
