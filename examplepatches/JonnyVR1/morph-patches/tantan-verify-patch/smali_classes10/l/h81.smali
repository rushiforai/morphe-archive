.class public final synthetic Ll/h81;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/o81;


# direct methods
.method public synthetic constructor <init>(Ll/o81;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h81;->a:Ll/o81;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h81;->a:Ll/o81;

    check-cast p1, Ll/hrk0$a;

    invoke-static {p0, p1}, Ll/o81;->X3(Ll/o81;Ll/hrk0$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
