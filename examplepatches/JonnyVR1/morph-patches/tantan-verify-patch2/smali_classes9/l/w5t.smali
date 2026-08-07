.class public final synthetic Ll/w5t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/i6t;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/i6t;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w5t;->a:Ll/i6t;

    iput-boolean p2, p0, Ll/w5t;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w5t;->a:Ll/i6t;

    iget-boolean p0, p0, Ll/w5t;->b:Z

    invoke-static {v0, p0, p1}, Ll/i6t;->b3(Ll/i6t;ZLjava/lang/Object;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
