.class public final synthetic Ll/ril0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ril0;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ril0;->a:Ljava/lang/String;

    check-cast p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    invoke-static {p0, p1}, Ll/yil0;->X(Ljava/lang/String;Lcom/momo/mcamera/filtermanager/MMPresetFilter;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
