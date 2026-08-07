.class public final synthetic Ll/fk30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mk30;


# direct methods
.method public synthetic constructor <init>(Ll/mk30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fk30;->a:Ll/mk30;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fk30;->a:Ll/mk30;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/mk30;->c(Ll/mk30;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
