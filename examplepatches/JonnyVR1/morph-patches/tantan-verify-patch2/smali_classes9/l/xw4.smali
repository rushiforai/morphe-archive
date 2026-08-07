.class public final synthetic Ll/xw4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ix4;


# direct methods
.method public synthetic constructor <init>(Ll/ix4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xw4;->a:Ll/ix4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xw4;->a:Ll/ix4;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/ix4;->N(Ll/ix4;Ljava/lang/String;)V

    return-void
.end method
