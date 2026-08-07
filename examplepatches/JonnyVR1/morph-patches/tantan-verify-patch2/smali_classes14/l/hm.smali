.class public final synthetic Ll/hm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VText;


# direct methods
.method public synthetic constructor <init>(Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hm;->a:Lv/VText;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hm;->a:Lv/VText;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/sm;->Z(Lv/VText;Ljava/lang/String;)V

    return-void
.end method
