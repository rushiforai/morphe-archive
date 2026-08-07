.class public final synthetic Ll/s4f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t4f$b;


# instance fields
.field public final synthetic a:Ll/t4f;


# direct methods
.method public synthetic constructor <init>(Ll/t4f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4f;->a:Ll/t4f;

    return-void
.end method


# virtual methods
.method public final create(Ll/ry3;)Ll/t4f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4f;->a:Ll/t4f;

    invoke-static {p0, p1}, Ll/t4f;->a(Ll/t4f;Ll/ry3;)Ll/t4f;

    move-result-object p0

    return-object p0
.end method
