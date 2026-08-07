.class public final synthetic Ll/dd10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/td10;


# direct methods
.method public synthetic constructor <init>(Ll/td10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dd10;->a:Ll/td10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dd10;->a:Ll/td10;

    check-cast p1, Ll/smj;

    invoke-static {p0, p1}, Ll/td10;->Y3(Ll/td10;Ll/smj;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
