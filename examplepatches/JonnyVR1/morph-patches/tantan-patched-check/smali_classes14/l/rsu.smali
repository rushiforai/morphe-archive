.class public final synthetic Ll/rsu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/wsu;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wsu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rsu;->a:Ll/wsu;

    iput-object p2, p0, Ll/rsu;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rsu;->a:Ll/wsu;

    iget-object p0, p0, Ll/rsu;->b:Ljava/lang/String;

    check-cast p1, Lrx/Notification;

    invoke-static {v0, p0, p1}, Ll/wsu;->a(Ll/wsu;Ljava/lang/String;Lrx/Notification;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
