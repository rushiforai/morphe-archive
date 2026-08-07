.class public final synthetic Ll/wdh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wdh0;->a:Ljava/lang/String;

    iput p2, p0, Ll/wdh0;->b:I

    iput p3, p0, Ll/wdh0;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wdh0;->a:Ljava/lang/String;

    iget v1, p0, Ll/wdh0;->b:I

    iget p0, p0, Ll/wdh0;->c:I

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, p0, p1}, Ll/aeh0;->b(Ljava/lang/String;IILl/gcg0;)V

    return-void
.end method
