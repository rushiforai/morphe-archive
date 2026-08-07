.class public final synthetic Ll/trm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/a5s;

.field public final synthetic b:Ll/rz4$a;


# direct methods
.method public synthetic constructor <init>(Ll/a5s;Ll/rz4$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/trm0;->a:Ll/a5s;

    iput-object p2, p0, Ll/trm0;->b:Ll/rz4$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/trm0;->a:Ll/a5s;

    iget-object p0, p0, Ll/trm0;->b:Ll/rz4$a;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/csm0;->Y4(Ll/a5s;Ll/rz4$a;Ll/uxj0;)V

    return-void
.end method
