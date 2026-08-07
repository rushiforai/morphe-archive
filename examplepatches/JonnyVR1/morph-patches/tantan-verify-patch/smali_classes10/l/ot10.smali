.class public final synthetic Ll/ot10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/st10;


# direct methods
.method public synthetic constructor <init>(Ll/st10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ot10;->a:Ll/st10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ot10;->a:Ll/st10;

    check-cast p1, Ll/rs10;

    invoke-static {p0, p1}, Ll/st10;->a4(Ll/st10;Ll/rs10;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
