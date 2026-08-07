.class public final synthetic Ll/vik0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ajk0;


# direct methods
.method public synthetic constructor <init>(Ll/ajk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vik0;->a:Ll/ajk0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vik0;->a:Ll/ajk0;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/ajk0;->f0(Ll/ajk0;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
