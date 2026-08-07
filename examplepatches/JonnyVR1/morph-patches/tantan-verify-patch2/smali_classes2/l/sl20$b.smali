.class Ll/sl20$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sl20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Lcom/android/volley/VolleyError;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sl20$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/sl20$b;->b:Lcom/android/volley/VolleyError;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Ll/sl20$a;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Ll/sl20$b;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    return-void
.end method

.method public static synthetic a(Ll/sl20$b;)Lcom/android/volley/VolleyError;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sl20$b;->b:Lcom/android/volley/VolleyError;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/sl20$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sl20$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
