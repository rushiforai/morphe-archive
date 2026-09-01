package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum k24 {
    UNRESOLVED_TYPE("Unresolved type for %s", true),
    UNRESOLVED_TYPE_PARAMETER_TYPE("Unresolved type parameter type", true),
    UNRESOLVED_CLASS_TYPE("Unresolved class %s", true),
    UNRESOLVED_JAVA_CLASS("Unresolved java class %s", true),
    UNRESOLVED_DECLARATION("Unresolved declaration %s", true),
    UNRESOLVED_KCLASS_CONSTANT_VALUE("Unresolved type for %s (arrayDimensions=%s)", true),
    UNRESOLVED_TYPE_ALIAS("Unresolved type alias %s", false),
    RETURN_TYPE("Return type for %s cannot be resolved", false),
    RETURN_TYPE_FOR_FUNCTION("Return type for function cannot be resolved", false),
    RETURN_TYPE_FOR_PROPERTY("Return type for property %s cannot be resolved", false),
    RETURN_TYPE_FOR_CONSTRUCTOR("Return type for constructor %s cannot be resolved", false),
    IMPLICIT_RETURN_TYPE_FOR_FUNCTION("Implicit return type for function %s cannot be resolved", false),
    IMPLICIT_RETURN_TYPE_FOR_PROPERTY("Implicit return type for property %s cannot be resolved", false),
    IMPLICIT_RETURN_TYPE_FOR_PROPERTY_ACCESSOR("Implicit return type for property accessor %s cannot be resolved", false),
    ERROR_TYPE_FOR_DESTRUCTURING_COMPONENT("%s() return type", false),
    RECURSIVE_TYPE("Recursive type", false),
    RECURSIVE_TYPE_ALIAS("Recursive type alias %s", false),
    RECURSIVE_ANNOTATION_TYPE("Recursive annotation's type", false),
    CYCLIC_UPPER_BOUNDS("Cyclic upper bounds", false),
    CYCLIC_SUPERTYPES("Cyclic supertypes", false),
    UNINFERRED_LAMBDA_CONTEXT_RECEIVER_TYPE("Cannot infer a lambda context receiver type", false),
    UNINFERRED_LAMBDA_PARAMETER_TYPE("Cannot infer a lambda parameter type", false),
    UNINFERRED_TYPE_VARIABLE("Cannot infer a type variable %s", false),
    RESOLUTION_ERROR_TYPE("Resolution error type (%s)", false),
    ERROR_EXPECTED_TYPE("Error expected type", false),
    ERROR_DATA_FLOW_TYPE("Error type for data flow", false),
    ERROR_WHILE_RECONSTRUCTING_BARE_TYPE("Failed to reconstruct type %s", false),
    UNABLE_TO_SUBSTITUTE_TYPE("Unable to substitute type (%s)", false),
    DONT_CARE("Special DONT_CARE type", false),
    STUB_TYPE("Stub type %s", false),
    FUNCTION_PLACEHOLDER_TYPE("Function placeholder type (arguments: %s)", false),
    TYPE_FOR_COMPILER_EXCEPTION("Error type for a compiler exception while analyzing %s", false),
    ERROR_FLEXIBLE_TYPE("Error java flexible type with id %s. (%s..%s)", false),
    ERROR_RAW_TYPE("Error raw type %s", false),
    TYPE_WITH_MISMATCHED_TYPE_ARGUMENTS_AND_PARAMETERS("Inconsistent type %s (parameters.size = %s, arguments.size = %s)", false),
    ILLEGAL_TYPE_RANGE_FOR_DYNAMIC("Illegal type range for dynamic type %s..%s", false),
    CANNOT_LOAD_DESERIALIZE_TYPE_PARAMETER("Unknown type parameter %s. Please try recompiling module containing \"%s\"", false),
    CANNOT_LOAD_DESERIALIZE_TYPE_PARAMETER_BY_NAME("Couldn't deserialize type parameter %s in %s", false),
    INCONSISTENT_SUSPEND_FUNCTION("Inconsistent suspend function type in metadata with constructor %s", false),
    UNEXPECTED_FLEXIBLE_TYPE_ID("Unexpected id of a flexible type %s. (%s..%s)", false),
    UNKNOWN_TYPE("Unknown type", false),
    NO_TYPE_SPECIFIED("No type specified for %s", false),
    NO_TYPE_FOR_LOOP_RANGE("Loop range has no type", false),
    NO_TYPE_FOR_LOOP_PARAMETER("Loop parameter has no type", false),
    MISSED_TYPE_FOR_PARAMETER("Missed a type for a value parameter %s", false),
    MISSED_TYPE_ARGUMENT_FOR_TYPE_PARAMETER("Missed a type argument for a type parameter %s", false),
    PARSE_ERROR_ARGUMENT("Error type for parse error argument %s", false),
    STAR_PROJECTION_IN_CALL("Error type for star projection directly passing as a call type argument", false),
    PROHIBITED_DYNAMIC_TYPE("Dynamic type in a not allowed context", false),
    NOT_ANNOTATION_TYPE_IN_ANNOTATION_CONTEXT("Not an annotation type %s in the annotation context", false),
    UNIT_RETURN_TYPE_FOR_INC_DEC("Unit type returned by inc or dec", false),
    RETURN_NOT_ALLOWED("Return not allowed", false),
    UNRESOLVED_PARCEL_TYPE("Unresolved 'Parcel' type", true),
    KAPT_ERROR_TYPE("Kapt error type", false),
    SYNTHETIC_ELEMENT_ERROR_TYPE("Error type for synthetic element", false),
    AD_HOC_ERROR_TYPE_FOR_LIGHTER_CLASSES_RESOLVE("Error type in ad hoc resolve for lighter classes", false),
    ERROR_EXPRESSION_TYPE("Error expression type", false),
    ERROR_RECEIVER_TYPE("Error receiver type for %s", false),
    ERROR_CONSTANT_VALUE("Error constant value %s", false),
    EMPTY_CALLABLE_REFERENCE("Empty callable reference", false),
    UNSUPPORTED_CALLABLE_REFERENCE_TYPE("Unsupported callable reference type %s", false),
    TYPE_FOR_DELEGATION("Error delegation type for %s", false),
    UNAVAILABLE_TYPE_FOR_DECLARATION("Type is unavailable for declaration %s", false),
    ERROR_TYPE_PARAMETER("Error type parameter", false),
    ERROR_TYPE_PROJECTION("Error type projection", false),
    ERROR_SUPER_TYPE("Error super type", false),
    SUPER_TYPE_FOR_ERROR_TYPE("Supertype of error type %s", false),
    ERROR_PROPERTY_TYPE("Error property type", false),
    ERROR_CLASS("Error class", false),
    TYPE_FOR_ERROR_TYPE_CONSTRUCTOR("Type for error type constructor (%s)", false),
    INTERSECTION_OF_ERROR_TYPES("Intersection of error types %s", false),
    CANNOT_COMPUTE_ERASED_BOUND("Cannot compute erased upper bound of a type parameter %s", false),
    NOT_FOUND_UNSIGNED_TYPE("Unsigned type %s not found", false),
    ERROR_ENUM_TYPE("Not found the corresponding enum class for given enum entry %s.%s", false),
    NO_RECORDED_TYPE("Not found recorded type for %s", false),
    NOT_FOUND_DESCRIPTOR_FOR_FUNCTION("Descriptor not found for function %s", false),
    NOT_FOUND_DESCRIPTOR_FOR_CLASS("Cannot build class type, descriptor not found for builder %s", false),
    NOT_FOUND_DESCRIPTOR_FOR_TYPE_PARAMETER("Cannot build type parameter type, descriptor not found for builder %s", false),
    UNMAPPED_ANNOTATION_TARGET_TYPE("Type for unmapped Java annotation target to Kotlin one", false),
    UNKNOWN_ARRAY_ELEMENT_TYPE_OF_ANNOTATION_ARGUMENT("Unknown type for an array element of a java annotation argument", false),
    NOT_FOUND_FQNAME_FOR_JAVA_ANNOTATION("No fqName for annotation %s", false),
    NOT_FOUND_FQNAME("No fqName for %s", false),
    TYPE_FOR_GENERATED_ERROR_EXPRESSION("Type for generated error expression", false);

    public final String a;
    public final boolean b;

    k24(String str, boolean z) {
        this.a = str;
        this.b = z;
    }

    public final String getDebugMessage() {
        return this.a;
    }

    public final boolean isUnresolved() {
        return this.b;
    }
}
