.class public final synthetic Ll/q3z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/u3z;

.field public final synthetic b:Ljava/lang/Class;

.field public final synthetic c:[I


# direct methods
.method public synthetic constructor <init>(Ll/u3z;Ljava/lang/Class;[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q3z;->a:Ll/u3z;

    iput-object p2, p0, Ll/q3z;->b:Ljava/lang/Class;

    iput-object p3, p0, Ll/q3z;->c:[I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q3z;->a:Ll/u3z;

    iget-object v1, p0, Ll/q3z;->b:Ljava/lang/Class;

    iget-object p0, p0, Ll/q3z;->c:[I

    check-cast p1, Ll/xsl;

    invoke-static {v0, v1, p0, p1}, Ll/u3z;->c(Ll/u3z;Ljava/lang/Class;[ILl/xsl;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
