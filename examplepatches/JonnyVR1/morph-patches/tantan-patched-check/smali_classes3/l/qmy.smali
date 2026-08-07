.class public final synthetic Ll/qmy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tmy;

.field public final synthetic b:Ljava/lang/Boolean;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/tmy;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qmy;->a:Ll/tmy;

    iput-object p2, p0, Ll/qmy;->b:Ljava/lang/Boolean;

    iput-object p3, p0, Ll/qmy;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qmy;->a:Ll/tmy;

    iget-object v1, p0, Ll/qmy;->b:Ljava/lang/Boolean;

    iget-object p0, p0, Ll/qmy;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/tmy;->X3(Ll/tmy;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
