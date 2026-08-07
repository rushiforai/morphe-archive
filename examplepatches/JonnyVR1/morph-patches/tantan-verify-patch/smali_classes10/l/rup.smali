.class public final synthetic Ll/rup;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xup;


# direct methods
.method public synthetic constructor <init>(Ll/xup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rup;->a:Ll/xup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rup;->a:Ll/xup;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/xup;->p4(Ljava/lang/String;)Z

    return-void
.end method
